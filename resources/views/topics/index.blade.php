@extends("layouts.app")

@section("content")

    <div class="container">
        <!-- Example single danger button -->
        <div class="dropdown">
            <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              Dropdown button
            </button>
            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
              <a class="dropdown-item" href="#">Action</a>
              <a class="dropdown-item" href="#">Another action</a>
              <a class="dropdown-item" href="#">Something else here</a>
            </div>
          </div>

        <div class="list-group">
            @foreach ($topics as $topic)
            <div class="list-group-item">
                <h5><a href="{{route("topics.show", $topic)}}">{{$topic->title}}</a></h5>
                <p>{{$topic->content}}</p>
                <div class="d-flex justify-content-between">
                    <small>
                        {{$topic->created_at->format("d/m/y à H:i")}}
                    </small>
                    <span class="badge badge-primary">
                        {{$topic->user->name}}
                    </span>
                </div>
            </div>
            <div class= "mt-3">

            </div>
            @endforeach
        </div>
        <div class="d-flex justify-content-center mt-3">
            {{$topics->links('pagination::bootstrap-4')}}
        </div>
    </div>

@endsection
