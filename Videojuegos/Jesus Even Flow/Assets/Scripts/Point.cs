using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Point : MonoBehaviour
{

    [SerializeField] Score scoreObj;
    [SerializeField] GameObject CorssParent;
    
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void OnTriggerEnter2D(Collider2D col)
    {
        scoreObj.AddPoints(1);
        Destroy(col.gameObject);
        NewCross();
    }
     void NewCross()
    {

        Vector3 pos = new Vector3(Random.Range(-11.0f, 45.0f), -2, 0);
        //Create a copy of the prefab
        GameObject obj = Instantiate(CorssParent, pos, Quaternion.identity);
        //Doom the object to die in 5 seconds
        //Destroy(obj, 5);
    }
}
