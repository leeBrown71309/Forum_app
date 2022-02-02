<?php

namespace App\Http\Controllers;

use App\Models\Topic;
use App\Models\Comment;
use Illuminate\Http\Request;

class CommentController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Topic $topic)
    {
        /* request()->validate([

            "content" => "required|min:5"
        ]); */
        $comment = new Comment();
        $comment->content = request("content");
        $comment->user_id = auth()->user()->id;

        $topic->comments()->save($comment);

        return redirect()->route("topics.show", $topic);

    }

    public function storeCommentReply(Comment $comment)
    {
        /* Request()->validate([
            "replyComment" => "required|min:3"
        ]); */

        $commentReply = new Comment();
        $commentReply->content = request("replyComment");
        $commentReply->user_id = auth()->user()->id;
        //$commentReply->commentable_id = $comment->id;

        $comment->comments()->save($commentReply);
        return redirect()->back();

    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
