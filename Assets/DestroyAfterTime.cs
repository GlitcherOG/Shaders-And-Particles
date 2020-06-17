using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DestroyAfterTime : MonoBehaviour
{
    public float time;
    // Start is called before the first frame update
    private void Update()
    {
        time -= Time.deltaTime;
        if(time<=0)
        {
            Destroy(this.gameObject);
        }
    }

}
