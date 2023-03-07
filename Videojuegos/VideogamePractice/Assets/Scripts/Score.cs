using System.Collections;
using System.Collections.Generic;
using UnityEngine;

//Keep track of the scores in the game

public class Score : MonoBehaviour
{
    int score;

    // Start is called before the first frame update
    void Start()
    {
        score = 0;
    }

    // Update is called once per frame
    public void AddPoints(int amount)
    {
        score += amount;
        Debug.Log("New score: " + score);
    }
}
