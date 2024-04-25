package main

import (
    "github.com/webview/webview_go"
    "net/http"
)

func main() {
    go func() {
        http.Handle("/", http.StripPrefix("/", http.FileServer(http.Dir("./website"))))
        http.ListenAndServe("localhost:52064", nil)
    }()

    w := webview.New(false)
    defer w.Destroy()
    w.SetTitle("Burgernotes")
    w.SetSize(800, 800, webview.HintNone)
    w.Navigate("http://localhost:52064")
    w.Run()
}
