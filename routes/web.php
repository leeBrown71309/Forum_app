<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\auth\RegisterController;
use App\Http\Controllers\auth\LoginController;
use App\Http\Controllers\TopicController;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\HomeController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

//Route::get("/",[TopicController::class, 'index'])->name("topics.index");
Route::get("/",[LoginController::class, '__construct']);
Route::resource("topics", "App\Http\Controllers\TopicController")->except(["index"]);
Auth::routes();

Route::get('/home', [HomeController::class, 'index'])->name('home');
