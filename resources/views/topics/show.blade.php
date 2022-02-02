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
                Show Topics
            </p>
            </div>
        </section>

        @section("extra-js")
            <script>
                function toggleReplyComment(id)
                {
                    let elemet = document.getElementById("replyComment-" + id);
                    elemet.classList.toggle("is-hidden");
                }
            </script>
        @endsection

        <div class="container">
            <div class="box mx-6">
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
             <div class="level">
                 @can("update",$topic)
                <button class="button is-success level-left is-outlined ml-6">
                    <span class="icon is-small level-item">
                      <i class="fa fa-check"></i>
                    </span>
                    <a href="{{ route("topics.edit", $topic) }}">Editer</a>
                  </button>
                  @endcan

                  @can("delete",$topic)
                  <form class="level-right  mr-6" action="{{ route("topics.destroy", $topic) }}" method="post">
                    @csrf
                    @method("DELETE")
                    <button class="button is-danger is-outlined level-item" type="submit">
                        <span>Delete</span>
                        <span class="icon is-small">
                          <i class="fa fa-times"></i>
                        </span>
                      </button>
                </form>
                @endcan
             </div>
             <hr>
                <p class="title is-4 ml-6"> Comments</p>

                @forelse ($topic->comments as $comment)
                <article class="message is-success box mx-4">
                    <div class="message-header">
                        <p>{{ $comment->user->name }}</p>
                        <p>{{ $comment->created_at->format("d/m/y") }} <span> at {{ $comment->created_at->format("H:i") }}</span></p>
                      </div>
                    <div class="message-body">
                      {{ $comment->content }}
                    </div>
                  </article>
                  <div class="control mx-6 my-2">
                    <button class="button is-info" onclick="toggleReplyComment({{ $comment->id }})">Reply</button>
                  </div>

                    @foreach ($comment->comments as $replyComment)
                    <article class="message is-info box mx-6">
                        <div class="message-header">
                            <p>{{ $replyComment->user->name }}</p>
                            <p>{{ $replyComment->created_at->format("d/m/y") }} <span> at {{ $replyComment->created_at->format("H:i") }}</span></p>
                          </div>
                        <div class="message-body">
                          {{ $replyComment->content }}
                        </div>
                      </article>
                    @endforeach
                  @auth {{-- visible par l'utilisateur connecter --}}

                  <form class="my-2 mx-6" action="{{ route("comments.storeReply", $comment) }}" method="post" id="replyComment-{{ $comment->id }}">
                    @csrf {{-- afin de se prémunir des faille web --}}
                    <div class="field mx-6">
                        <label  for="replyComment" class="label">Reply</label>

                        <div class="control">
                          <textarea class="textarea form-control @error("replyComment") is-invalid @enderror"
                          placeholder="Type your comment" name="replyComment" id="replyComment" rows="5"></textarea>
                          @error("replyComment")
                        <div>
                            <p class="help is-danger invalid-feedback">{{ $errors->first("replyComment") }}</p>
                        </div>

                         @enderror
                        </div>
                             <!-- Main container -->
                        <nav class="level mt-3">
                            <!-- Right side -->
                            <div class="level-right">
                                <button class="button is-info" type="submit">Send</button>
                            </div>
                        </nav>
                      </div>


                  </form>
                  @endauth

                @empty
                    <div class="alert alert-info">Aucun commentaire pour ce topic</div>

                @endforelse
             <form action="{{ route("comments.store", $topic) }}" method="post">
                @csrf
                <div class="field mx-6">
                    <label  for="content" class="label"> Your Comment</label>
                    <div class="control">
                      <textarea class="textarea form-control @error("content") is-invalid @enderror"
                      placeholder="Type your content" name="content" id="content" rows="5"></textarea>
                      @error("content")
                        <div>
                            <p class="help is-danger invalid-feedback">{{ $errors->first("content") }}</p>
                        </div>

                     @enderror
                     <div class="field is-grouped mt-3 mb-5">
                        <div class="control">
                          <button class="button is-info">Post Comment</button>
                        </div>
                      </div>
                    </div>
                  </div>
            </form>



    </body>
</html>