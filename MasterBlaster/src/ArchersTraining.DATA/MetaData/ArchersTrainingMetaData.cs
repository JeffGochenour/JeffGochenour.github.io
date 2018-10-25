using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;//added

namespace ArchersTraining.DATA//.MetaData
{
    
    #region Course
    public class CourseMetaData
    {
        public int CourseID { get; set; }

        [Required(ErrorMessage = "***Course Name is required***")]
        [StringLength(50, ErrorMessage = "Course name cannot be more than 50 charecters")]
        [Display(Name = "Course Name")]
        public string Name { get; set; }

        [DisplayFormat(NullDisplayText = "No description provided")]
        [StringLength(500, ErrorMessage = "Course description cannot be more than 500 charecters")]
        [UIHint("MultilineText")]
        public string Description { get; set; }

        public Nullable<int> CategoryID { get; set; }

        [Display(Name = "Active")]
        public bool IsActive { get; set; }
    }
    [MetadataType(typeof(CourseMetaData))]
    public partial class Course { }
    #endregion

    #region CourseCompletion
    public class CourseCompletionMetaData
    {
        public int CourseCompletionID { get; set; }
        public string UserID { get; set; }
        public int CourseID { get; set; }

        [Display(Name = "Completion Date")]
        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}", ApplyFormatInEditMode = true)]
        public System.DateTime DateCompleted { get; set; }
    }
    [MetadataType(typeof(CourseCompletionMetaData))]
    public partial class CourseCompletion { }
    #endregion

    #region Lesson
    public class LessonMetaData
    {
        public int LessonID { get; set; }

        [Required(ErrorMessage = "***Lesson Name is required***")]
        [StringLength(150, ErrorMessage = "Lesson name cannot be more than 150 charecters")]
        [Display(Name = "Lesson Name")]
        public string LessonName { get; set; }
        public int CourseID { get; set; }

        [DisplayFormat(NullDisplayText = "No Introduction provided")]
        [StringLength(500, ErrorMessage = "Lesson introduction cannot be more than 500 charecters")]
        [UIHint("MultilineText")]
        public string Introduction { get; set; }

        [DisplayFormat(NullDisplayText = "No Video URL provided")]
        [StringLength(150, ErrorMessage = "Video URL cannot be more than 150 charecters")]
        [UIHint("MultilineText")]
        [Display(Name = "Video URL")]
        public string VideoUrl { get; set; }

        //[DisplayFormat(NullDisplayText = "No PDF provided")]
        //[StringLength(150, ErrorMessage = "PDF file name cannot be more than 150 charecters")]
        //[UIHint("MultilineText")]
        [Display(Name = "PDF")]
        public string PdfFileName { get; set; }

        [Display(Name = "Active")]
        public bool IsActive { get; set; }

    }
    [MetadataType(typeof(LessonMetaData))]
    public partial class Lesson { }
    #endregion

    #region LessonView
    public class LessonViewMetaData
    {
        public int LessonViewID { get; set; }
        public string UserID { get; set; }
        public int LessonID { get; set; }

        [Display(Name = "Date Viewed")]
        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}", ApplyFormatInEditMode = true)]
        public System.DateTime DateViewed { get; set; }
    }
    [MetadataType(typeof(LessonViewMetaData))]
    public partial class LessonView { }
    #endregion

    #region TrainingCategory
    public class TrainingCategoryMetaData
    {
        public int CategoryID { get; set; }

        [Required(ErrorMessage = "***Category Name is required***")]
        [StringLength(150, ErrorMessage = "Category name cannot be more than 150 charecters")]
        [Display(Name = "Category")]
        public string Name { get; set; }

        [DisplayFormat(NullDisplayText = "No Training category provided")]
        [StringLength(500, ErrorMessage = "Category description cannot be more than 500 charecters")]
        [UIHint("MultilineText")]
        public string Description { get; set; }
    }
    [MetadataType(typeof(TrainingCategoryMetaData))]
    public partial class TrainingCategory { }
    #endregion

    #region ASPNetUser
    public class AspNetUserMetaData
    {
        public string Id { get; set; }

        

        [Display(Name = "Name")]
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public bool EmailConfirmed { get; set; }
        public string PasswordHash { get; set; }
        public string SecurityStamp { get; set; }
        public string PhoneNumber { get; set; }
        public bool PhoneNumberConfirmed { get; set; }
        public bool TwoFactorEnabled { get; set; }
        public Nullable<System.DateTime> LockoutEndDateUtc { get; set; }
        public bool LockoutEnabled { get; set; }
        public int AccessFailedCount { get; set; }
        [Display(Name = "Email")]
        public string UserName { get; set; }

    }
    
    [MetadataType(typeof(AspNetUserMetaData))]
    public partial class AspNetUser { }
    #endregion

    #region UserDetails

    public class UserDetailMetaData
    {
        public int ID { get; set; }
        public string UserID { get; set; }

        [DisplayFormat(NullDisplayText = "No View Provided")]
        [Display(Name = "Top View")]
        public string TopImage { get; set; }

        [DisplayFormat(NullDisplayText = "No View Provided")]
        [Display(Name = "Back View")]
        public string BackImage { get; set; }

        [DisplayFormat(NullDisplayText = "No View Provided")]
        [Display(Name = "Front View")]
        public string FrontImage { get; set; }

        [DisplayFormat(NullDisplayText = "There are no notes for user.")]
        [StringLength(1000, ErrorMessage = "Notes cannot be more than 1,000 charecters.")]
        [UIHint("MultilineText")]
        public string Notes { get; set; }

    }

    [MetadataType(typeof(UserDetailMetaData))]
    public partial class UserDetail { }
    #endregion



}
