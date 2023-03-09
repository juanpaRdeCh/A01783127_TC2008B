using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;

//Keep track of the scores in the game

public class Score : MonoBehaviour
{
    [SerializeField] TMP_Text tmpObj;
    [SerializeField] int maxScore;
    [SerializeField] behavior1 creator;
    int score;

    // Start is called before the first frame update
    void Start()
    {
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
            Finish();
        }
    }

    void Finish(){
        creator.StopBalls();
    }
}
