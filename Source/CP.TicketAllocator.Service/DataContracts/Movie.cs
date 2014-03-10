using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;

namespace CP.TicketAllocator.Model
{
    [DataContract]
    public class Movie
    {
        [DataMember(Order = 1)]
        public int MovieID { get; set; }
        [DataMember(Order = 2)]
        public string MovieName { get; set; }
        [DataMember(Order = 3)]
        public string Rating { get; set; }
        [DataMember(Order = 4)]
        public string Poster { get; set; }
    }
}
