using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CP.TicketAllocator.Models
{
    public class Movie : BaseModel
    {
        public int MovieID { get; set; }
        public string MovieName { get; set; }
        public string Rating { get; set; }
        public string Poster { get; set; }
    }
}
