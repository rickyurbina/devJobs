<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class RolUsuario
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse
     */
    public function handle(Request $request, Closure $next)
    {
        if ($request->user()->rol === 1)
        {
            //En caso del que no tenga rol 2, se redigirá al home
            return redirect()->route('home');
        }   
        return $next($request);
    }
}
