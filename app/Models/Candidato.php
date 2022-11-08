<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Candidato extends Model
{
    use HasFactory;
    // estos son los datos que se guardaran en el modelo de Candidato
    protected $fillable =[
        'user_id',
        'vacante_id',
        'cv'
    ];

    public function user(){
        return $this->belongsTo(User::class);
    }
}
