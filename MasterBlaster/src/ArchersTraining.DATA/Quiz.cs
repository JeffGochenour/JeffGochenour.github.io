//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ArchersTraining.DATA
{
    using System;
    using System.Collections.Generic;
    
    public partial class Quiz
    {
        public int QuizID { get; set; }
        public string Question { get; set; }
        public string CorrectAnswer { get; set; }
        public string Answer2 { get; set; }
        public string Answer3 { get; set; }
        public string Answer4 { get; set; }
        public int CourseID { get; set; }
        public bool IsInUse { get; set; }
    
        public virtual Course Cours { get; set; }
    }
}