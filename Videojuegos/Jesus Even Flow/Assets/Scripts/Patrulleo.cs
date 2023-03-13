using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Patrulleo : MonoBehaviour
{
    [SerializeField] float amplitude;
    [SerializeField] float speed;
    [SerializeField] SpriteRenderer sprite;


    Vector3 initiaPosition;
    Vector3 offset;
    float angle;
    // Start is called before the first frame update
    void Start()
    {
        initiaPosition = transform.position;
    }

    // Update is called once per frame
    void Update()
    {
        angle += speed * Time.deltaTime;
        offset = new Vector3(Mathf.Sin(angle) * amplitude, 0, 0);
        transform.position = initiaPosition + offset;
        
        if(Mathf.Sin(angle) < -0.999){
        sprite.flipX = false;
        }
        else if (Mathf.Sin(angle) > 0.999){
            sprite.flipX = true;
        }
    }
}
