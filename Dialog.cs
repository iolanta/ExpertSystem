using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using ClipsFormsExample;

namespace AutoFormsExample
{
    public partial class Dialog : Form
    {
        private List<RadioButton> control_list = new List<RadioButton>();
        public Dialog(string quest, List<string> answers)
        {
            InitializeComponent();
            label1.Text = quest;
            if (answers.Count <= 0)
                return;
            for(int i = 0; i < answers.Count(); ++i)
            {
                RadioButton rb = new RadioButton();
                rb.Text = answers[i];
                flowLayoutPanel1.Controls.Add(rb);
                control_list.Add(rb);
            }
            (flowLayoutPanel1.Controls[0] as RadioButton).Checked = true;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            (Owner as ExpertSystemForm).answer_index = control_list.FindIndex(x => x.Checked);
            DialogResult = DialogResult.OK;
            Close();
        }

        private void Dialog_FormClosing(object sender, FormClosingEventArgs e)
        {
            if (DialogResult != DialogResult.OK)
                e.Cancel = true;
        }
    }
}
