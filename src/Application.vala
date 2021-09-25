/*
 * SPDX-License-Identifier: GPL-3.0-or-later
 * SPDX-FileCopyrightText: 2021 wesley montaigne <wesleybudista@gmail.com>
 valac Application.vala --pkg gtk+-3.0

 */
 using GLib;
 using Gtk;

public class Example : Window
{    private Entry entry;
   

private Image image;
    public Example()
    {

        
        this.title = "Sleep Time";
        this.destroy.connect(Gtk.main_quit);
        this.set_resizable(false);


        var grid = new Grid();
        grid.set_row_spacing(10);
        this.add(grid);
        var label1 = new Label("Just set the hour to turn off.");
        var label2= new Label("TAFAPP wesleybudista@gmail.com");
        grid.add(label1);
        image = new Image ();
        image.set_from_file ("/usr/share/data/pw.png");
        entry = new Entry();
        entry.set_placeholder_text("14:00");
        //entry.activate.connect(on_button_clicked);

        grid.attach(entry, 0, 4, 1, 1);
        grid.attach(image, 0, 100, 1, 1);
        grid.attach(label2, 0, 110, 1, 1);

        //var button2 = new Button.with_label("Button 2");
        //grid.attach(button2, 1, 0, 1, 2);
        var button3 = new Button.with_label("SET");
        button3.clicked.connect(on_button_clicked);
        grid.attach(button3, 0, 10, 1, 1);
    }



    private void on_button_clicked(Button button3)
    {
        var text = entry.get_text();
        try {
            button3.set_label("scheduled");
            Process.spawn_command_line_sync ("shutdown -h "+text);
            image.set_from_file ("/usr/share/data/pw2.png");

           





           
                var notification = new Notification ("William");
                notification.set_body ("This is my first notification!");
               GLib.Application.get_default ().send_notification ("com.github.wesleymontaigne.sleeptime",notification);
           
           
            
        
        } catch (SpawnError e) {
            print ("Error: %s\n", e.message);
        }
    }

    public static int main(string[] args)
    {
        Gtk.init(ref args);

        var window = new Example();
        window.show_all();

        Gtk.main();

        return 0;
    }
}

