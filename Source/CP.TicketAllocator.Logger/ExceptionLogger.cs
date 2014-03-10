using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CP.TicketAllocator.Logger
{
    public static class ExceptionLogger
    {
        private static log4net.ILog log = log4net.LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);

        public static log4net.ILog Logger
        {
            get
            {
                return log;
            }
        }

        public static void LogException(LogType logType, object message, Exception e)
        {
            try
            {
                switch (logType)
                {
                    case LogType.Debug:
                        log.Debug(message, e);
                        break;
                    case LogType.Error:
                        log.Error(message, e);
                        break;
                    case LogType.Fatal:
                        log.Fatal(message, e);
                        break;
                    case LogType.Info:
                        log.Info(message, e);
                        break;
                    case LogType.Warn:
                        log.Warn(message, e);
                        break;
                }
            }
            catch(Exception ex)
            {
                log.FatalFormat(ex.Message);
            }
        }
    }
}
