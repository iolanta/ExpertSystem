using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using AutoFormsExample;

using CLIPSNET;

namespace ClipsFormsExample
{
    public partial class ExpertSystemForm : Form
    {
        private CLIPSNET.Environment clips = new CLIPSNET.Environment();
        public int answer_index = -1;

        public ExpertSystemForm()
        {
            InitializeComponent();

        }

        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
        }

        private void HandleResponse()
        {
            //  Вытаскиаваем факт из ЭС
            String evalStr = "(find-fact ((?f ioproxy)) TRUE)";
            FactAddressValue fv = (FactAddressValue)((MultifieldValue)clips.Eval(evalStr))[0];

            MultifieldValue damf = (MultifieldValue)fv["messages"];
            MultifieldValue vamf = (MultifieldValue)fv["answers"];

            textBox1.Text += "Новая итерация : " + System.Environment.NewLine;
            for (int i = 0; i < damf.Count; i++)
            {
                LexemeValue da = (LexemeValue)damf[i];
                byte[] bytes = Encoding.Default.GetBytes(da.Value);
                textBox1.Text += Encoding.UTF8.GetString(bytes) + System.Environment.NewLine;
            }

            if (vamf.Count > 0)
            {
                textBox1.Text += "----------------------------------------------------" + System.Environment.NewLine;

                List<string> answers = new List<string>();
                LexemeValue da = (LexemeValue)damf[damf.Count - 1];
                byte[] bytes = Encoding.Default.GetBytes(da.Value);
                string question = Encoding.UTF8.GetString(bytes) + System.Environment.NewLine;
                
                for (int i = 0; i < vamf.Count; i++) 
                {
                    LexemeValue va = (LexemeValue)vamf[i];
                    answers.Add(va.Value + System.Environment.NewLine);
                }
                Dialog df = new Dialog(question, answers);
                df.ShowDialog(this);
            }

            clips.Eval("(assert (clearmessage))");
        }

    private void nextBtn_Click(object sender, EventArgs e)
    {
        clips.Run();
        HandleResponse();
    }

    private void resetBtn_Click(object sender, EventArgs e)
    {
        textBox1.Text = "Выполнены команды Clear и Reset." + System.Environment.NewLine;
        //  Здесь сохранение в файл, и потом инициализация через него
        clips.Clear();
      
     /* string stroka = codeBox.Text;
      System.IO.File.WriteAllText("tmp.clp", codeBox.Text);
      clips.Load("tmp.clp");*/

        //  Так тоже можно - без промежуточного вывода в файл
        clips.LoadFromString(codeBox.Text);

        clips.Reset();
    }

    private void openFile_Click(object sender, EventArgs e)
    {
        if(clipsOpenFileDialog.ShowDialog() == DialogResult.OK)
        {
            codeBox.Text = System.IO.File.ReadAllText(clipsOpenFileDialog.FileName);
            Text = "Экспертная система \"Тиндер\" – " + clipsOpenFileDialog.FileName;
        }
    }

    private void fontSelect_Click(object sender, EventArgs e)
    {
        if(fontDialog1.ShowDialog() == DialogResult.OK)
        {
            codeBox.Font = fontDialog1.Font;
            textBox1.Font = fontDialog1.Font;
        }
    }

    private void saveAsButton_Click(object sender, EventArgs e)
    {
        clipsSaveFileDialog.FileName = clipsOpenFileDialog.FileName;
        if (clipsSaveFileDialog.ShowDialog() == DialogResult.OK)
        {
            System.IO.File.WriteAllText(clipsSaveFileDialog.FileName, codeBox.Text);
        }
    }
  }
}
