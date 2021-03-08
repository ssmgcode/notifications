public class MyApp : Gtk.Application {
    public MyApp () {
        Object (
            application_id: "com.github.ssmgcode.notifications",
            flags: ApplicationFlags.FLAGS_NONE
        );
    }

    protected override void activate () {
        var main_window = new Gtk.ApplicationWindow (this) {
            default_height = 300,
            default_width = 300,
            title = _("GLib Notifications")
        };

        var title_label = new Gtk.Label (_("Notifications"));
        var show_button = new Gtk.Button.with_label (_("Show"));

        var grid = new Gtk.Grid () {
            orientation = Gtk.Orientation.VERTICAL,
            row_spacing = 6
        };
        
        grid.add (title_label);
        grid.add (show_button);

        main_window.add (grid);

        show_button.clicked.connect (() => {
            var notification = new Notification (_("Hello World"));
            notification.set_body (_("This is my first notification"));

            send_notification ("com.github.ssmgcode.notifications", notification);
        });
        
        main_window.show_all ();
    }

    public static int main (string[] args) {
        return new MyApp ().run (args);
    }
}
