#include <webkit2/webkit2.h>
#include <gtk/gtk.h>
#include <unistd.h>
#include <libgen.h>

static void cookie_changed_cb(WebKitCookieManager *cookie_manager, GParamSpec *pspec, gpointer user_data) {
    // Handle cookie changes here
    g_print("Cookie changed\n");
}

int main(int argc, char *argv[]) {
    gtk_init(&argc, &argv);

    // Create a new window
    GtkWidget *window = gtk_window_new(GTK_WINDOW_TOPLEVEL);
    gtk_window_set_title(GTK_WINDOW(window), "PageBurger");
    gtk_window_set_default_size(GTK_WINDOW(window), 1000, 600);
    g_signal_connect(window, "destroy", G_CALLBACK(gtk_main_quit), NULL);

    // Create a web view widget
    WebKitWebView *webview = WEBKIT_WEB_VIEW(webkit_web_view_new());

    // Get the path of the executable
    char exe_path[1024];
    ssize_t len = readlink("/proc/self/exe", exe_path, sizeof(exe_path)-1);
    if (len == -1) {
        perror("readlink");
        return EXIT_FAILURE;
    }
    exe_path[len] = '\0';

    // Get the directory containing the executable
    char *exe_dir = dirname(exe_path);

    // Construct the path to the website directory
    char website_path[1024];
    snprintf(website_path, sizeof(website_path), "file:/\/%s/website/app/index.html", exe_dir);

    // Load the URI
    webkit_web_view_load_uri(webview, website_path);

    // Add the web view to the window
    gtk_container_add(GTK_CONTAINER(window), GTK_WIDGET(webview));

    // Show all widgets
    gtk_widget_show_all(window);

    // Connect signals for handling cookies
    WebKitCookieManager *cookie_manager = webkit_web_context_get_cookie_manager(webkit_web_view_get_context(webview));
    g_signal_connect(cookie_manager, "notify::cookie-accept-policy", G_CALLBACK(cookie_changed_cb), NULL);

    // Run the main GTK event loop
    gtk_main();

    return 0;
}
