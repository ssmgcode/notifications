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

        var grid = new Gtk.Grid () {
            orientation = Gtk.Orientation.VERTICAL,
            row_spacing = 6
        };

        var title_label = new Gtk.Label (_("Notifications"));
        var show_button = new Gtk.Button.with_label (_("Show"));
        var replace_button = new Gtk.Button.with_label (_("Replace"));
        var priority_button = new Gtk.Button.with_label (_("Priority Notification"));
        
        grid.add (title_label);
        grid.add (show_button);
        grid.add (replace_button);
        grid.add (priority_button);

        main_window.add (grid);

        show_button.clicked.connect (() => {
            var notification = new Notification (_("Hello World"));
            notification.set_body (_("This is my first notification"));

            var icon = new GLib.ThemedIcon ("dialog-password");
            notification.set_icon (icon);

            send_notification ("com.github.ssmgcode.notifications", notification);
        });

        replace_button.clicked.connect (() => {
            var icon = new GLib.ThemedIcon ("dialog-warning");
            var notification = new Notification (_("Hello Again"));
            
            notification.set_body (_("This is my second Notification!"));
            notification.set_icon (icon);

            send_notification ("com.github.ssmgcode.notifications", notification);
        });

        priority_button.clicked.connect (() => {
            var notification = new Notification (_("Urgent Notification"));
            var icon = new GLib.ThemedIcon ("dialog-warning");

            notification.set_priority (NotificationPriority.URGENT);
            notification.set_body (_("This is a urgent notification"));
            notification.set_icon (icon);

            send_notification ("com.github.ssmgcode.notifications", notification);
        });
        
        main_window.show_all ();
    }

    public static int main (string[] args) {
        return new MyApp ().run (args);
    }
}
