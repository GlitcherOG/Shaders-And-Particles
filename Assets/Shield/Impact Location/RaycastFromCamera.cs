using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class RaycastFromCamera : MonoBehaviour
{
    public Ray ray; 
    void Update()
    {
        if(Input.GetMouseButtonDown(0))
        {
            ray = Camera.main.ScreenPointToRay(Input.mousePosition);
            RaycastHit hit;
            if(Physics.Raycast(ray, out hit,100))
            {
                Debug.Log(hit.point);
                Debug.Log(hit.collider.gameObject);
                ReceiveRaycast recieve = hit.collider.gameObject.GetComponent<ReceiveRaycast>();
                if(recieve)
                {
                    recieve.SetHitPosition(hit.point);
                }
            }
        }
    }
}
