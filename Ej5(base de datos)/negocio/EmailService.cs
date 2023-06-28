using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Runtime.Remoting.Metadata.W3cXsd2001;
using System.Text;
using System.Threading.Tasks;

namespace negocio
{
    public class EmailService
    {
        private MailMessage email;
        private SmtpClient server;
        public EmailService()
        {
            server = new SmtpClient();
            server.Credentials = new NetworkCredential("alexismcanete@gmail.com", "tsqthmwjdoyfzrjr");
            server.EnableSsl = true;
            server.Port = 587;
            server.Host = "smtp.gmail.com";
        }
        public void ArmarCorreo(string emaildestino,string asunto,string mensaje)
        {
            email = new MailMessage();
            email.From = new MailAddress("noresponder@ecommerceprogramacioniii.com");
            email.To.Add(emaildestino);
            email.Subject = asunto;
            email.Body = mensaje + "\n\n<hr/><p>\n mensaje enviado por programa creado en html con c#</h1>";
            email.IsBodyHtml = true;          
            //email.Body = " <footer>\r\n<hr />\r\n Mensaje enviado con programa creado en c#</footer>";
        }
        public void EnviarCorreo()
        {
            try
            {
                server.Send(email);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}
