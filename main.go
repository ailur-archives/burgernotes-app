package main

import (
    "github.com/arzumify/webview_go-4.1"
    "net/http"
    "os"
    "path/filepath"
)

func main() {
    go func() {
        exepath, _ := os.Executable()
        path, _ := filepath.EvalSymlinks(exepath)

        http.Handle("/", http.StripPrefix("/", http.FileServer(http.Dir(filepath.Dir(path) + "/website"))))
        http.ListenAndServe("localhost:52064", nil)
    }()

    w := webview.New(false)
    defer w.Destroy()
    w.SetTitle("Burgernotes")
    w.SetSize(800, 800, webview.HintNone)
    w.Navigate("http://localhost:52064")
    w.Run()
}
