﻿using System;
using System.Collections.Generic;

#nullable disable

namespace Entidades
{
    public partial class Facultades
    {
        public Facultades()
        {
            ListadoCarreras = new HashSet<ListadoCarreras>();
        }

        public int FacultadId { get; set; }
        public string Nombre { get; set; }
        public string Direccion { get; set; }
        public int? Telefono { get; set; }
        public string DepartamentoAlumnos { get; set; }
        public string Facebook { get; set; }
        public string Instagram { get; set; }
        public string Twitter { get; set; }
        public string PaginaWeb { get; set; }
        public string Email { get; set; }
        public string RecorridoVirtual { get; set; }

        public virtual ICollection<ListadoCarreras> ListadoCarreras { get; set; }
    }
}
