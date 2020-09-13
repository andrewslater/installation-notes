## Useful Packages
- ProBuilder
  - Easily build geometry within your scene
- Input System 
  - Improved Input system
  - NOTE: Say "YES" when asked about enabling the new input system upon package installation

## When Starting Project...
- Create new folders: Scripts, Materials, Controls
- Create Capsule named "Player"
- Add Character Controller to Player
- Add empty object named "GroundCheck" to Player and place at base of Player geometry
- In Controls folder create Input Actions named PlayerControls
  - Configure controls for Move, Look, Jump, etc
  - Be sure to save before closing
  - After mapping the controls as desired, select PlayerControls and in its inspector window use the "Generate C# Class" checkbox to generate scripts/PlayerControls.cs
- In Scripts folder create Player script

```
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[RequireComponent(typeof(CharacterController))]
public class Player : MonoBehaviour
{
    private CharacterController _controller;
    
    private PlayerControls _controls;
    private Vector2 _move = Vector2.zero;
    private Vector2 _look = Vector2.zero;
    
    [SerializeField] 
    private float speed = 10f;
    
    void Awake()
    {
        _controls = new PlayerControls();
        _controller = GetComponent<CharacterController>();
        _controls.Gameplay.Move.performed += ctx => _move = ctx.ReadValue<Vector2>();
        _controls.Gameplay.Move.canceled += ctx => _move = Vector2.zero;
        
        _controls.Gameplay.Look.performed += ctx => _look = ctx.ReadValue<Vector2>();
        _controls.Gameplay.Look.canceled += ctx => _look = Vector2.zero;    
    }
    
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        print($"Move: {_move.x},{_move.y}");
        if (_move != Vector2.zero)
        {
            _controller.Move(new Vector3(_move.x, 0, _move.y) * (Time.deltaTime * speed));    
        }
    }
    
    void OnEnable()
    {
        _controls.Gameplay.Enable(); 
    }

    void OnDisable()
    {
        _controls.Gameplay.Disable();
    }
}
```


