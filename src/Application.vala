/*
 * SPDX-License-Identifier: GPL-3.0-or-later
 * SPDX-FileCopyrightText: 2021 Your Name <wesleybudista@gmail.com>
 */

using Gtk;

public class Example : Window
{

    private Entry entry;
    public Example()
    {
        this.title = "Sleep Time";
        this.destroy.connect(Gtk.main_quit);

        var grid = new Grid();
        grid.set_row_spacing(15);
        grid.set_column_spacing(15);
        this.add(grid);

        entry = new Entry();
        entry.set_placeholder_text("Enter some text...");
        //entry.activate.connect(on_entry_activated);

        grid.attach(entry, 0, 0, 1, 1);
        //var button2 = new Button.with_label("Button 2");
        //grid.attach(button2, 1, 0, 1, 2);
        var button3 = new Button.with_label("Set");
        button3.clicked.connect(on_button_clicked);
        grid.attach(button3, 0, 1, 1, 1);
    }

    private void on_button_clicked(Button button3)
    {
        var text = entry.get_text();
        try {
            button3.set_label("scheduled");
            Process.spawn_command_line_sync ("shutdown -h "+text);
            
        
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

