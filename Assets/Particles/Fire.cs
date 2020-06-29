using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;

public class Fire : MonoBehaviour
{
    public ParticleSystem test;
    public AudioClip clip;
    public AudioSource Audio;
    public GameObject boom;
    private ParticleCollisionEvent[] CollisionEvents;

    public void Start()
    {
        Audio.clip = clip;
    }
    public void Fires()
    {
        Audio.Play();
        test.Stop();
        test.Play();
    }

    public void OnParticleCollision(GameObject other)
    {
        CollisionEvents = new ParticleCollisionEvent[1];

        int eventCount = test.GetCollisionEvents(other, CollisionEvents);

        Instantiate(boom, CollisionEvents[0].intersection, new Quaternion(0, 0, 0, 0));
    }
}
