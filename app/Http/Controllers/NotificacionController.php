<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class NotificacionController extends Controller
{
    /**
     * Handle the incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function __invoke(Request $request)
    {
        // Obtenemos las notificaciones nuevas y el  historial de las notificaciones
        $notificaciones = auth()->user()->unreadNotifications;
        $historialNotificaciones = auth()->user()->readNotifications;

        // Limpiar las notificaciones una vez que se han visto
        auth()->user()->unreadNotifications->markAsRead();

        return view('notificaciones.index', [
            'notificaciones' => $notificaciones,
            'historialNotificaciones' => $historialNotificaciones
        ]);
    }
}
