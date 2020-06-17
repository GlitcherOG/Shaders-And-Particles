using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DisolveControl : MonoBehaviour
{
    public Renderer meshRenderer;
    public Material instanceMaterial;
    [Range(0,1)]
    public float dissolveAmount;
    private void Start()
    {
        instanceMaterial = meshRenderer.material;
    }
    private void Update()
    {
        instanceMaterial.SetFloat("_DissolveAmount", dissolveAmount);
    }
}
