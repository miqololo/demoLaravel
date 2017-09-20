{{-- \resources\views\users\edit.blade.php --}}

@extends('layouts.app')

@section('title', '| Edit User')

@section('content')

    <div class='col-lg-4 col-lg-offset-4'>

        <h1><i class='fa fa-user-plus'></i> Edit {{$user->name}}</h1>
        <hr>

        {{ Form::model($user, array('route' => array('users.update', $user->id), 'method' => 'PUT')) }}{{-- Form model binding to automatically populate our fields with user data --}}

        <div class="form-group">
            {{ Form::label('first_name', 'First Name') }}
            {{ Form::text('first_name', null, array('class' => 'form-control')) }}
        </div>
        <div class="form-group">
            {{ Form::label('last_name', 'Last Name') }}
            {{ Form::text('last_name', null, array('class' => 'form-control')) }}
        </div>
        <div class="form-group">
            {{ Form::label('username', 'Username') }}
            {{ Form::text('username', null, array('class' => 'form-control')) }}
        </div>
        <div class="form-group">
            {{ Form::label('description', 'description') }}
            {{ Form::textarea('description', null, array('class' => 'form-control')) }}
        </div>
        <h5><b>Give Role</b></h5>

        <div class='form-group'>
            @foreach ($roles as $role)
                {{ Form::checkbox('roles[]',  $role->id, $user->roles ) }}
                {{ Form::label($role->name, ucfirst($role->name)) }}<br>

            @endforeach
        </div>
        <div class='form-group'>
                {{ Form::radio('active',  1, $user->active ) }}
                {{ Form::label("active", ucfirst("enable")) }}
                {{ Form::radio('active',  0, $user->active ) }}
                {{ Form::label("active", ucfirst("disabled")) }}
        </div>
        <br>
        <div class="form-group">
            {{ Form::label('password', 'Password') }}<br>
            {{ Form::password('password', array('class' => 'form-control')) }}
        </div>

        <div class="form-group">
            {{ Form::label('password', 'Confirm Password') }}<br>
            {{ Form::password('password_confirmation', array('class' => 'form-control')) }}
        </div>

        {{ Form::submit('Update', array('class' => 'btn btn-primary')) }}

        {{ Form::close() }}

    </div>

@endsection