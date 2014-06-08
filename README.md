AudioPlayground
===============

OK, so there's a file in examples/files and there's an exs in examples.

```sh
mix run examples/play_file.exs
```

That will read the bytes out of the file, spawn a `pacat` process, and send them
into its STDIN.  That part works.

The next step is to generate the audio stream to send into pacat's STDIN in the
first place, then we can start doing some fun audio stuff :)

My first go at this requires a sine wave, so I built one and then built a meter
to visualize it:

```sh
mix run examples/sine_wave_visualization.exs
```

For kicks, here's the output of that example:

```
[                                     x   ]
[                                      x  ]
[                                       x ]
[                                        x]
[                                        x]
[                                        x]
[                                       x ]
[                                      x  ]
[                                     x   ]
[                                   x     ]
[                                 x       ]
[                               x         ]
[                             x           ]
[                          x              ]
[                        x                ]
[                     x                   ]
[                  x                      ]
[               x                         ]
[             x                           ]
[          x                              ]
[        x                                ]
[      x                                  ]
[    x                                    ]
[   x                                     ]
[ x                                       ]
[ x                                       ]
[x                                        ]
[x                                        ]
[x                                        ]
[ x                                       ]
[  x                                      ]
[   x                                     ]
[     x                                   ]
[       x                                 ]
[         x                               ]
[            x                            ]
[              x                          ]
[                 x                       ]
[                    x                    ]
[                       x                 ]
[                         x               ]
[                            x            ]
[                              x          ]
[                                 x       ]
```

I wrote a module that can sample an oscillator and generate a PCM .au file and
pipe it through paplay.  To see an example of it in use:

```sh
mix run examples/pcm_sampler.exs
```
