<?php

namespace App\Http\Controllers;

use App\File;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class FileController extends Controller
{
    public function uploadFile(Request $request) {
        $image = $request->file('file');
        //$filename = $image->getClientOriginalName();
        $filename = rand(11111, 99999);
        $extension = $image->getClientOriginalExtension();//$image->getClientOriginalExtionsion();
        $path = $request->path;
        $save = $image->move('storage/'.$path,$filename . '.' . $extension);
        //$save = $image->storeAs('public/'.$path,$filename . '.' . $extension);
        $save = str_replace("storage/","",$save);
        //$filename = pathinfo($filenameWithExt, PATHINFO_FILENAME);
        //$extension = $request->file('file')->getClientOriginalExtionsion();
        return '/storage/' . $save;//'/' . $path . '/' . $filename . '.' . $extension;

        /* $file = Input::file('file');
        $filename = $file->getClientOriginalName();

        $path = hash( 'sha256', time());

        if(Storage::disk('uploads')->put($path.'/'.$filename,  File::get($file))) {
            $input['filename'] = $filename;
            $input['mime'] = $file->getClientMimeType();
            $input['path'] = $path;
            $input['size'] = $file->getClientSize();
            $file = File::create($input);

            return response()->json([
                'success' => true,
                'id' => $file->id
            ], 200);
        }
        return response()->json([
            'success' => false
        ], 500); */
    }
    public function index() {
        $files = File::all();
        return compact('files');
    }

    
}
