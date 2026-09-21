# Building a Web Server — Assembly

This directory contains my solutions for the **pwn.college – Building a Web Server** challenge series.

## File Structure

Each `.s` file represents a different stage of the challenge.

The files are **not independent programs**. They are progressive versions of the same web server. Each stage builds on the previous one by adding new functionality.

Every file contains the **complete assembly code up to that specific stage**, rather than only the new code introduced in that challenge.

In other words:

```text
exit
  ↓
socket
  ↓
bind
  ↓
listen
  ↓
accept
  ↓
static-response
  ↓
dynamic-response
  ↓
iterative-get-server
  ↓
concurrent-get-server
  ↓
concurrent-post-server
  ↓
full web server
```

So, for example:

- `socket.s` contains the complete code up to the socket stage.
- `bind.s` contains the previous socket functionality plus `bind`.
- `listen.s` continues from the previous stages and adds `listen`.
- `dynamic-response.s` contains the complete server developed up to dynamic file responses.
- `concurrent-get server.s` adds concurrent GET request handling using `fork`.
- `concurrent-post server.s` adds concurrent POST request handling.
- `full web server.s` combines both GET and POST handling into one server.

Therefore, the files should be viewed as **a progression of the same project**, where each file represents a new milestone in building the final web server.

## Final Result

The final stage combines:

- TCP socket creation
- Binding to `0.0.0.0:80`
- Listening for connections
- Accepting clients
- Process-based concurrency using `fork`
- HTTP GET request handling
- HTTP POST request handling
- File reading and writing
- HTTP `200 OK` responses

The purpose of keeping every stage as a separate file is to make the development process easier to follow and to show how the server was gradually built from basic Linux syscalls into a functional concurrent HTTP server.
