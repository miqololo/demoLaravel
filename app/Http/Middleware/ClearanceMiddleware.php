<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\Auth;

class ClearanceMiddleware {
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next) {
        if (Auth::user()->hasPermissionTo('edit')) //If user has this //permission
        {
            return $next($request);
        }

        if ($request->is('user/create'))//If user is creating a post
        {
            if (!Auth::user()->hasPermissionTo('create'))
            {
                abort('401');
            }
            else {
                return $next($request);
            }
        }

        if ($request->is('user/*/edit')) //If user is editing a post
        {
            if (!Auth::user()->hasPermissionTo('edit')) {
                abort('401');
            } else {
                return $next($request);
            }
        }

        if ($request->isMethod('delete')) //If user is deleting a post
        {
            if (!Auth::user()->hasPermissionTo('delete')) {
                abort('401');
            }
            else
            {
                return $next($request);
            }
        }

        return $next($request);
    }
}