﻿using System.Collections.Generic;
using System.Linq;

namespace ProvaSP.Model.Abstractions
{
    public abstract class Notificable
    {
        public bool Valid => !ErrorMessages?.Any() ?? true;
        public ICollection<string> ErrorMessages { get; private set; }

        public Notificable()
        {
            ErrorMessages = new List<string>();
        }

        protected void AddErrorMessage(string message) => ErrorMessages.Add(message);
    }
}