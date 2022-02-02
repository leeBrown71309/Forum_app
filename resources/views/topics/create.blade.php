<!DOCTYPE html>
<html  lang="{{ str_replace('_', '-', app()->getLocale()) }}">
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
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

</head>
<body>


    <section class="hero is-info mx-4 mb-2">
        <div class="hero-body">
          <p class="title is-2">
            Create topics
          </p>
        </div>
      </section>

      @section("extra-js")
        {!! NoCaptcha::renderJs() !!}
     @endsection


    <div class="mx-6">

       <form class="container" action="{{ route("topics.store") }}" method="post">
        @csrf
          <div class="field">
            <label for="title" class="label">Subject</label>
            <div class="control  has-icons-left">
              <input class="input form-control @error("title") is-invalid @enderror" type="text"
              placeholder="type your title" name="title" id="title">
              <span class="icon is-small is-left">
                <i class="fa fa-pencil" aria-hidden="true"></i>
              </span>
              @error("title")
            <div>
                <p class="help is-danger invalid-feedback">{{ $errors->first("title") }}</p>
            </div>

          @enderror
            </div>
          </div>
          <div class="field">
            <label class="label">Catégories</label>
            <div class="control">
              <div class="select">
                <select>
                  <option>Catégories 1</option>
                  <option>Catégories 2</option>
                </select>
              </div>
            </div>
          </div>
          <div class="field">
            <label  for="content" class="label">Content</label>
            <div class="control">
              <textarea class="textarea form-control @error("content") is-invalid @enderror"
              placeholder="Type your content" name="content" id="content" rows="10"></textarea>
              @error("content")
            <div>
                <p class="help is-danger invalid-feedback">{{ $errors->first("content") }}</p>
            </div>

             @enderror
            </div>
          </div>

          {{-- <div class="mt-2">
              {!! NoCaptcha::display() !!}
          </div> --}}

          <div class="field is-grouped">
            <div class="control">
              <button class="button is-info">Create</button>
            </div>
            <div class="control">
              <button class="button is-link is-light">Cancel</button>
            </div>
          </div>
        </form>

        </div>



</body>
</html>