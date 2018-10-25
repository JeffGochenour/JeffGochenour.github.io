using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace ArchersTraining.UI.Models
{
    public class ContactViewModel
    {
        [Required(ErrorMessage = "*Required")]
        public string Name { get; set; }
        [Required(ErrorMessage = "*Required")]
        [RegularExpression(@"^[A-Za-z0-9](([_\.\-]?[a-zA-Z0-9]+)*)@([A-Za-z0-9]+)(([\.\-]?[a-zA-Z0-9]+)*)\.([A-Za-z]{2,})$", ErrorMessage = "Please Enter a Valid email address")]
        public string Email { get; set; }
        [Required(ErrorMessage = "*Required")]
        public string Message { get; set; }
        [Required(ErrorMessage = "*Required")]
        public string Subject { get; set; }
    }
}