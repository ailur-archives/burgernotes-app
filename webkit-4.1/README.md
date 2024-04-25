# webview_go-4.1

[![GoDoc](https://godoc.org/github.com/arzumify/webview_go-4.1?status.svg)](https://godoc.org/github.com/arzumify/webview_go-4.1)
[![Go Report Card](https://goreportcard.com/badge/github.com/arzumify/webview_go-4.1)](https://goreportcard.com/report/github.com/webview/webview_go)

Go language binding for the [webview library][webview], for webkitgtk-4.1.
This is entirely backwards compatible with webview_go 4.0, and needs only a dependency replacement.

> [!NOTE]
> Versions <= 0.1.1 are available in the [old repository][webview].

### Getting Started

See [Go package documentation][go-docs] for the Go API documentation, or simply read the source code.

Start with creating a new directory structure for your project.

```sh
mkdir my-project && cd my-project
```

Create a new Go module.

```sh
go mod init example.com/app
```

Save one of the example programs into your project directory.

```sh
curl -sSLo main.go "https://raw.githubusercontent.com/arzumify/webview_go-4.1/master/examples/basic/main.go"
```

Install dependencies.

```sh
go get github.com/webview/webview_go
```

Build the example. On Windows, add `-ldflags="-H windowsgui"` to the command line.

```sh
go build
```

### Notes

Calling `Eval()` or `Dispatch()` before `Run()` does not work because the webview instance has only been configured and not yet started.

[go-docs]: https://pkg.go.dev/github.com/arzumify/webview_go-4.1
[webview]: https://github.com/webview/webview
