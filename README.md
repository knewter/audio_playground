AudioPlayground
===============

OK, so there's a file in examples/files and there's an exs in examples.

```sh
elixir examples/play_file.exs
```

That will read the bytes out of the file, spawn a `pacat` process, and send them
into its STDIN.  That part works.

The next step is to generate the audio stream to send into pacat's STDIN in the
first place, then we can start doing some fun audio stuff :)
