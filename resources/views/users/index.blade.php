{{-- \resources\views\users\index.blade.php --}}
@extends('layouts.app')

@section('title', '| Users')

@section('content')

    <div class="col-lg-10 col-lg-offset-1">
        <h1><i class="fa fa-users"></i> User Administration
            </h1>
        <hr>
        {!! Form::open(['method' => 'GET' ]) !!}
        Show items per page{!! Form::select('perPage', [10=>'10',20=>'20',50=>'50'],$perPage,["class"=>"form-control","onchange"=>"this.form.submit()"]) !!}
        {!! Form::close() !!}
        <div class="table-responsive">
            <table class="table table-bordered table-striped">

                <thead>
                <tr>
                    <th>Full Name</th>
                    <th>Username</th>
                    <th>User Roles</th>
                    <th>Operations</th>
                </tr>
                </thead>

                <tbody>
                @foreach ($users as $user)
                    <tr>

                        <td>{{ $user->first_name }} {{ $user->last_name }}</td>
                        <td>{{ $user->username }}</td>
                        <td>{{  $user->roles()->pluck('name')->implode(' ') }}</td>{{-- Retrieve array of roles associated to a user and convert to string --}}
                        <td>
                                <a href="{{ route('users.edit', $user->id) }}" class="btn btn-info pull-left" style="margin-right: 3px;">Edit</a>
                                {!! Form::open(['method' => 'DELETE', 'route' => ['users.destroy', $user->id] ]) !!}
                                {!! Form::submit('Delete', ['class' => 'btn btn-danger',"style"=>"float:left"]) !!}
                                {!! Form::close() !!}
                                {!! Form::open(['method' => 'GET', 'route' => ['user.activate', $user->id] ]) !!}
                                {!! Form::submit(($user->active)?'Deactivate':'Activate', ['class' => 'btn '.(($user->active)?'btn-danger':'btn-success'),"style"=>"float:left;margin-left:3px;"]) !!}
                                {!! Form::close() !!}
                        </td>
                    </tr>
                @endforeach
                </tbody>

            </table>
        </div>
        {{ $users->links() }}
        <a href="{{ route('users.create') }}" class="btn btn-success">Add User</a>

    </div>

@endsection