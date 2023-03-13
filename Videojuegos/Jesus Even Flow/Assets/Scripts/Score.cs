using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;

public class Score : MonoBehaviour
{
    [SerializeField] TMP_Text tmpObj;
    [SerializeField] int maxScore;
    [SerializeField] Point creator;
    public GameObject winner;

    int score;

    // Start is called before the first frame update
    void Start()
    {
        winner.SetActive(false);

        // creator = GetComponent...
        score = 0;
    }

    // Update is called once per frame
    public void AddPoints(int amount)
    {
        score += amount;
        tmpObj.text = "Score:" + score;
        Debug.Log("New score: " + score);

        if (score == maxScore){

            winner.SetActive(true);

         }

    }
    
}
