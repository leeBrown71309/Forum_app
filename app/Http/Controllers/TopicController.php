<?php

namespace App\Http\Controllers;

use App\Models\Topic;

use App\Models\User;
use Illuminate\Contracts\Validation\Rule;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class TopicController extends Controller
{
    //impose l'authentification avant d'effectuer les traitements des autre fonctions
    //toutes les methodes du controller ne sont accesible que on est connecter except
    //la méthode index et show
    public function __construct()
    {
        $this->middleware('auth')->except(["index","show"]);
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $topics = Topic::latest()->paginate(10);
        return view("topics.index", compact("topics"));

    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view("topics.create");
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        /* $data = $request->validate([
            "title"=> "required|min:5",
            "content"=> "required|min:10",

        ]); */

        $id = Auth::user()->id;
        $topic = new Topic();
        $topic->title = $request->title;
        $topic->content = $request->content;
        $topic->user_id = $id;

        $topic->save();
        return redirect()->route("topics.show",$topic->id);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Topic  $topic
     * @return \Illuminate\Http\Response
     */
    public function show(Topic $topic)
    {
        return view("topics.show", compact("topic"));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Topic  $topic
     * @return \Illuminate\Http\Response
     */
    public function edit(Topic $topic)
    {
        //si non auth... no accès
        $this->authorize("update", $topic);
        return view("topics.edit",compact("topic"));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Topic  $topic
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Topic $topic)
    {
        //si non auth... no accès
        $this->authorize("update", $topic);

        $id = Auth::user()->id;
        $topic = Topic::find($request->id);
        $topic->title = $request->title;
        $topic->content = $request->content;
        $topic->user_id =  $id;

        $topic->save();
        return redirect()->route("topics.show", $topic->id);

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Topic  $topic
     * @return \Illuminate\Http\Response
     */
    public function destroy(Topic $topic)
    {
        //si non auth... no accès
        $this->authorize("delete", $topic);

        Topic::destroy($topic->id);
        return redirect("/");
    }
}
