using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using System.Data;
using CP.TicketAllocator.Model;
using CP.TicketAllocator.DAL;
using CP.TicketAllocator.Logger;

namespace CP.TicketAllocator.Service
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "TicketAllocatorService" in both code and config file together.
    public class TicketAllocatorService : ITicketAllocatorService
    {
        public List<Model.Cinema> GetCinemas()
        {
            return DBGateway.GetData<Cinema>(DBObjects.GetCinemas, CreateCinemaFunc);
        }

        public List<Model.Movie> GetMovies(short CinemaID, DateTime Date)
        {
            Dictionary<string, object> param = new Dictionary<string, object>();
            param.Add("@CinemaID", CinemaID);
            param.Add("@SelectedDate", Date);
            return DBGateway.GetData<Movie>(DBObjects.GetMovies, CreateMovieFunc, param);
        }

        public List<Model.ShowTime> GetShowTime(short CinemaID, int MovieID)
        {
            Dictionary<string, object> param = new Dictionary<string, object>();
            param.Add("@CinemaID", CinemaID);
            param.Add("@MovieID", MovieID);
            return DBGateway.GetData<ShowTime>(DBObjects.GetMovies, CreateShowTimeFunc, param);
        }

        public short GetAvailableSeats(int ShowTimeID, DateTime Date)
        {
            throw new NotImplementedException();
        }

        public bool AllocateMovieTicket(int ShowTimeID, DateTime date, short NoOfSeats)
        {
            Dictionary<string, object> inParam = new Dictionary<string, object>();
            inParam.Add("@MovieShowTimeID", ShowTimeID);
            inParam.Add("@SelectedDate", date);
            inParam.Add("@Seats", NoOfSeats);

            Dictionary<string, object> outParam = new Dictionary<string, object>();
            outParam.Add("@ErrorNo", 0);
            outParam.Add("@ErrorMessage", string.Empty);

            if(!DBGateway.UpdateData(DBObjects.AllocateTickets, ref outParam, inParam) ||
                Convert.ToInt32(outParam["@ErrorNo"]) != 0)
            {
                TraceLogger.LogTrace(LogType.Error, Convert.ToString(outParam["@ErrorMessage"]), ShowTimeID, date, NoOfSeats);
                return false;                
            }
            return true;           
        }

        private Func<IDataReader, Movie> CreateMovieFunc = reader =>
        new Movie
        {
            MovieID = Convert.ToInt32(reader["MovieID"]),
            MovieName = Convert.ToString(reader["MovieName"]),
            Rating = Convert.ToString(reader["Rating"]),
            Poster = Convert.ToString(reader["Poster"])
        };



        private Func<IDataReader, Cinema> CreateCinemaFunc = reader =>
        new Cinema
        {

            CinemaID = Convert.ToInt16(reader["CinemaID"]),
            Capacity = Convert.ToInt16(reader["Capacity"]),
            CinemaName = Convert.ToString(reader["CinemaName"]),
            Price = Convert.ToDouble(reader["Price"])
        };


        private Func<IDataReader, ShowTime> CreateShowTimeFunc = reader =>
        new ShowTime
        {
            ShowTimeID = Convert.ToInt32(reader["ShowTimeID"]),
            ShowName = TimeSpan.Parse(Convert.ToString(reader["ShowName"])),
            Description = Convert.ToString(reader["Descriptions"])
        };
    }
}
