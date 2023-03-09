using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class XMotion : MonoBehaviour
{
Vector3 move;

    [SerializeField] float speed;
    [SerializeField] float limit;
    [SerializeField] SpriteRenderer sprite;
    public Rigidbody2D rb;
    public float jumpAmount = 10;
    public bool grounded = false;

    // Start is called before the first frame update
    void Start()
    {
        rb = GetComponent < Rigidbody2D >();
    }

    // Update is called once per frame
    void Update()
    {
       Move();
       Jump();
    }
    void Move(){
        move.x = Input.GetAxis("Horizontal");

        //Debug.Log("X motion" + move.x);

        //limit the position to a specific range of coordinates
        if(transform.position.x < -limit && move.x < 0){
            move.x = 0;
        }
        else if (transform.position.x > limit && move.x > 0){
            move.x =0;
        }
        
        if(move.x < 0){
            sprite.flipX = false;
        }
        else if (move.x > 0){
            sprite.flipX = true;
            
        }


        
        transform.Translate(move * speed * Time.deltaTime);
    }

    void Jump(){
        if (Input.GetKeyDown(KeyCode.Space) && grounded)
    {
        grounded=false;
        rb.AddForce(Vector2.up * jumpAmount, ForceMode2D.Impulse);
    }
    }
    void OnCollisionEnter2D(Collision2D col){
        if(col.gameObject.tag=="Ground"){
            grounded=true;
        }
    }
}
