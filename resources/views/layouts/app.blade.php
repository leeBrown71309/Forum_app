<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('app.name', 'SupForum') }}</title>

    <!-- Scripts -->
    <script src="{{ asset('js/app.js') }}" defer></script>

    @yield("extra-js")
    
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>

    <!-- Fonts -->
    <link rel="dns-prefetch" href="//fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet">


    <!-- Styles -->
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

</head>
<body>

    <nav class="navbar box" role="navigation" aria-label="main navigation">
        <div class="navbar-brand">
            <h2 class="title is-3"><a href="{{ url('/') }}">SupForum</a></h2>
        </div>
          <div class="navbar-end">
            <div class="navbar-item">
               <div class="buttons">
                @guest
                @if (Route::has('login'))
                        <a class="button is-primary nav-link" href="{{ route('login') }}">
                            <strong>Sign in</strong>
                          </a>
                @endif
                @if (Route::has('register'))
                        <a class="button is-light nav-link"  href="{{ route('register') }}">
                            Sign up
                          </a>
                @endif
            @else
            @endguest
               </div>
            </div>
          </div>
      </nav>



    <div id="app">
        <main class="py-4">
            @yield('content')

        </main>

    </div>

</body>
</html>


