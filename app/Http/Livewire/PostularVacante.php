<?php

namespace App\Http\Livewire;

use App\Models\Vacante;
use App\Notifications\NuevoCandidato;
use Livewire\Component;
use Livewire\WithFileUploads;

class PostularVacante extends Component
{
    use WithFileUploads;
    public $cv;
    public $vacante;
    
    protected $rules =[
        'cv' => 'required|mimes:pdf'
    ];

    public function mount(Vacante $vacante)
    {
        $this->vacante = $vacante;
    }

    public function postularme()
    {
        $datos = $this->validate();

        // Almacenar la imagen
        $cv = $this->cv->store('public/cv');
        // al poner $datos['cv'] reescribimos el valor que trae el campo imagen desde el formulario con 
        // el nombre del cv que se genera temporalmente por livewire
        $datos['cv'] = str_replace('public/cv/','', $cv);


        //Crear candidato en la vacante
        $this->vacante->candidatos()->create([
            'user_id' => auth()->user()->id,
            'cv' => $datos['cv'] 
        ]);

        //Crear notificacion y enviar email 
        $this->vacante->reclutador->notify(new NuevoCandidato($this->vacante->id, $this->vacante->titulo, auth()->user()->id ));
        
        //Mostrar al usuario mensaje de OK

        session()->flash('mensaje', 'Tu postulación ha sido enviada, mucha suerte!');

        return redirect()->back();
    }

    public function render()
    {
        return view('livewire.postular-vacante');
    }
}
