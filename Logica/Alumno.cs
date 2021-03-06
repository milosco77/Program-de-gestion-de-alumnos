﻿using Entidades;
using System;
using System.Collections.Generic;

namespace Logica
{
    public static class Alumno
    {
#nullable enable
        public static Entidades.Alumnos ListarUno(int? alumnoID = null, string? nombre = null, string? apellido = null, int? edad = null, int? dni = null)
        {
            if (alumnoID != null)
            {
                return Datos.Alumno.ListarUno(alumnoID: alumnoID);
            }
            else if (nombre != null)
            {
                return Datos.Alumno.ListarUno(nombre: nombre);
            }
            else if (apellido != null)
            {
                return Datos.Alumno.ListarUno(apellido: apellido);
            }
            else if (edad != null)
            {
                return Datos.Alumno.ListarUno(edad: edad);
            }
            return Datos.Alumno.ListarUno(dni: dni);
        }

        public static List<Entidades.Alumnos> ListarVarios(int? alumnoID = null, string ? nombre = null, string? apellido = null, int? edad = null, int? dni = null)
        {

            if (alumnoID != null)
            {
                return Datos.Alumno.ListarVarios(alumnoID: alumnoID);

            }
            if (nombre != null)
            {
                return Datos.Alumno.ListarVarios(nombre: nombre);
            }
            else if (apellido != null)
            {
                return Datos.Alumno.ListarVarios(apellido: apellido);

            }

            else if (edad != null)
            {
                return Datos.Alumno.ListarVarios(edad: edad);

            }
            return Datos.Alumno.ListarVarios(dni: dni);
        }

#nullable disable

        public static List<Entidades.Alumnos> ListarTodos()
        {
            return Datos.Alumno.ListarTodos();
        }

        public static string Agregar(Entidades.Alumnos alumno)
        {
            return Datos.Alumno.Agregar(alumno);
        }

        public static string Editar(Entidades.Alumnos alumno)
        {
            return Datos.Alumno.Editar(alumno);
        }
#nullable enable
        public static string Eliminar(int? alumnoID = null, string? nombre = null, string? apellido = null, int? edad = null, int? dni = null)
        {
            if (alumnoID != null)
            {
                return Datos.Alumno.Eliminar(alumnoID: alumnoID);
            }
            else if (nombre != null)
            {
                return Datos.Alumno.Eliminar(nombre: nombre);
            }
            else if (apellido != null)
            {
                return Datos.Alumno.Eliminar(apellido: apellido);
            }
            else if (edad != null)
            {
                return Datos.Alumno.Eliminar(edad: edad);
            }
            return Datos.Alumno.Eliminar(dni: dni);
        }
#nullable disable
    }
}
