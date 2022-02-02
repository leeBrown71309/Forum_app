
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
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>

    <!-- Fonts -->
    <link rel="dns-prefetch" href="//fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet">


    <!-- Styles -->
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">



</head>
<body>
    <div class="block mx-4">
        <section class="hero is-info is-small">
            <!-- Hero head: will stick at the top -->
            <div class="hero-head mt-4">
              <nav class="navbar">
                <div class="container">
                  <div class="navbar-brand">
                    <a class="navbar-item" href=" {{ url('/') }}">
                      <img src="https://bulma.io/images/bulma-type-white.png" alt="Logo">
                    </a>
                    <span class="navbar-burger" data-target="navbarMenuHeroA">
                      <span></span>
                      <span></span>
                      <span></span>
                    </span>
                  </div>
                  <div id="navbarMenuHeroA" class="navbar-menu">
                    <div class="navbar-end">
                      <a class="navbar-item block">
                        Home
                      </a>
                      <a class="navbar-item block">
                        About
                      </a>
                      <a class="navbar-item block">
                        Contact us
                      </a>
                      @guest
                      <a class="navbar-item button is-primary has-text-white block ml-2" href="{{ route("login") }}">
                        Connexion
                      </a>

                        @else
                        <span class="navbar-item block mb-4">
                            <div class="dropdown is-hoverable">
                                <div class="dropdown-trigger">
                                  <button class="button" aria-haspopup="true" aria-controls="dropdown-menu4">
                                    <div class="icon-text">
                                        <span class="icon has-text-primary">
                                            <i class="fa fa-user"></i>
                                          </span>
                                        <span class="has-text-primary">{{ Auth::user()->name }}</span>
                                    </div>
                                  </button>
                                </div>
                                <div class="dropdown-menu" id="dropdown-menu4" role="menu">
                                  <div class="dropdown-content">
                                    <div class="dropdown-item">
                                        <div class="icon-text">
                                            <span class="icon has-text-primary">
                                                <i class="fa fa-user"></i>
                                              </span>
                                           <a class="has-text-primary" href="#">Profile</a>
                                        </div>
                                    </div>
                                    <div class="dropdown-item">
                                       <div class="icon-text">
                                        <span class="icon has-text-danger">
                                            <i class="fa fa-sign-out"></i>
                                          </span>
                                          <a class="has-text-danger" href="{{ route('logout') }}"
                                          onclick="event.preventDefault();
                                          document.getElementById('logout-form').submit();">
                                          {{ __('Logout') }}
                                      </a>

                                        <form id="logout-form" action="{{ route('logout') }}" method="POST" class="d-none">
                                            @csrf
                                        </form>
                                       </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                          </span>
                    @endguest
                    </div>
                  </div>
                </div>
              </nav>
            </div>

            <!-- Hero content: will be in the middle -->
            <div class="hero-body">
              <div class="container has-text-centered">
                <p class="title is-1">
                  SupForum
                </p>
                <p class="subtitle is-2">
                  Find everything you want
                </p>
              </div>
            </div>

            <!-- Hero footer: will stick at the bottom -->
            <div class="hero-foot">
              <nav class="tabs is-boxed is-fullwidth">
                <div class="container">
                  <ul>
                    <li><a href="{{ route("topics.create") }}">New</a></li>
                    <li><a>Modifiers</a></li>
                    <li><a>Grid</a></li>
                    <li><a>Elements</a></li>
                    <li><a>Components</a></li>
                    <li><a>Layout</a></li>
                  </ul>
                </div>
              </nav>
            </div>
          </section>
    </div>


    @section("content")
    <div class="container">

        <div class="list-group">
            @foreach ($topics as $topic)
            <div class="box">
                <article class="media">
                  <div class="media-left">
                    <figure class="image is-128x128">
                      <img src="https://bulma.io/images/placeholders/128x128.png" alt="Image">
                    </figure>
                  </div>
                  <div class="media-content">
                    <div class="content">
                        <h3 class="text is-4"><a href="{{route("topics.show", $topic)}}">{{$topic->title}}</a></h3>
                      <p>
                        <strong> {{$topic->user->name}}</strong> <small> @</small><small>{{$topic->user->name}}</small>
                        <br>
                       <p class="bock">
                        {{$topic->content}}
                       </p>
                      </p>
                    </div>
                    <nav class="level is-mobile">
                      <div class="level-left">
                        <a class="level-item" aria-label="reply">
                          <span class="icon is-small">
                            <i class="fa fa-reply" aria-hidden="true"></i>
                          </span>
                        </a>
                        <a class="level-item" aria-label="retweet">
                          <span class="icon is-small">
                            <i class="fa fa-retweet" aria-hidden="true"></i>
                          </span>
                        </a>
                        <a class="level-item" aria-label="like">
                          <span class="icon is-small">
                            <i class="fa fa-heart" aria-hidden="true"></i>
                          </span>
                        </a>
                      </div>
                      <div class="level-right">
                          <div class="level-item">
                              <p>{{ $topic->created_at->format("d/m/y") }} <span> at {{ $topic->created_at->format("H:i") }}</span></p>
                          </div>
                      </div>
                    </nav>
                  </div>
                </article>
              </div>

            @endforeach
        </div>

        <div class="container my-4">
            {{$topics->links("vendor.pagination.custom_pagination")}}
        </div>



    </div>

{{-- to run all dropdown in this page --}}
   <script>
       // to make work dropdown button
                    // Get all dropdowns on the page that aren't hoverable.
                const dropdowns = document.querySelectorAll('.dropdown:not(.is-hoverable)');

                if (dropdowns.length > 0) {
                // For each dropdown, add event handler to open on click.
                dropdowns.forEach(function(el) {
                    el.addEventListener('click', function(e) {
                    closeDropdowns();
                    e.stopPropagation();
                    el.classList.toggle('is-active');
                    });
                });

                // If user clicks outside dropdown, close it.
                document.addEventListener('click', function(e) {
                    closeDropdowns();
                });
                }

                /*
                * Close dropdowns by removing `is-active` class.
                */
                function closeDropdowns() {
                dropdowns.forEach(function(el) {
                    el.classList.remove('is-active');
                });
                }

                // Close dropdowns if ESC pressed
                document.addEventListener('keydown', function (event) {
                let e = event || window.event;
                if (e.key === 'Esc' || e.key === 'Escape') {
                    closeDropdowns();
                }
                });
   </script>
{{-- end --}}

</body>
</html>


