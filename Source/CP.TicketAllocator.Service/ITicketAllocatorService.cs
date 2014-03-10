using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using CP.TicketAllocator.Model;

namespace CP.TicketAllocator.Service
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "ITicketAllocatorService" in both code and config file together.
    [ServiceContract]
    public interface ITicketAllocatorService
    {
        [OperationContract]
        List<Cinema> GetCinemas();

        [OperationContract]
        List<Movie> GetMovies(short CinemaID, DateTime Date);

        [OperationContract]
        List<ShowTime> GetShowTime(short CinemaID, int MovieID);

        [OperationContract]
        short GetAvailableSeats(int ShowTimeID, DateTime Date);

        [OperationContract]
        bool AllocateMovieTicket(int ShowTimeID, DateTime date, short NoOfSeats);

    }
}
