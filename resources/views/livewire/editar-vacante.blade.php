<form class="md:w-1/2 space-y-5" wire:submit.prevent='editarVacante'>
    <div>
        <x-input-label for="titulo" :value="__('Titulo Vacante')" />
        {{-- la referencia :wire:model es para enlazar el elemento del formulario con el componente de livewire 
            adicionalmente se debe declarar en el controller del componente este elemento para poder comunicar esta
            vista con el controlador--}}
        <x-input 
            id="titulo" 
            class="block mt-1 w-full" 
            type="text" 
            wire:model="titulo" 
            :value="old('titulo')" 
            placeholder="Titulo de la vacante" />
            @error('titulo')
            {{-- Mostrar-alerta es otro componente de livewire y lo usamos para darle presentacion a los mensajes de error
                que se muestran cuando uno de los campos no cumple con la validacion, la variable $message viene incluida en
                livewire y muestra los posibles mensajes de error --}}
                <livewire:mostrar-alerta :message='$message' />
            @enderror
    </div>
    <div>
        <x-input-label for="salario" :value="__('Salario Mensual')" />

        <select 
            wire:model="salario" 
            id="salario" 
            class="rounded-md shadow-sm border-gray-300 focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50 w-full"
        >
            <option>-- Seleccione --</option>
            @foreach ($salarios as $salario){
                {{-- con esta linea estamos accediendo al modelo de salario para obtener todos los datos registrados en el select --}}
                <option value="{{ $salario->id }}"> {{ $salario->salario }}</option>
            }
                
            @endforeach
        </select>
        @error('salario')
                <livewire:mostrar-alerta :message='$message' />
            @enderror
    </div>
    <div>
        <x-input-label for="categoria" :value="__('Categoria')" />

        <select wire:model="categoria" id="categoria" class="rounded-md shadow-sm border-gray-300 focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50 w-full">
            <option>-- Seleccione --</option>
            @foreach ($categorias as $categoria){
                {{-- con esta linea accedemos al modelo de categorias para mostrarlos en el select --}}
                <option value="{{ $categoria->id }}"> {{ $categoria->categoria }}</option>
            }
                
            @endforeach
        </select>
        @error('categoria')
                <livewire:mostrar-alerta :message='$message' />
            @enderror
    </div>
    <div>
        <x-input-label for="empresa" :value="__('Empresa')" />

        <x-input id="empresa" class="block mt-1 w-full" type="text" wire:model="empresa" :value="old('empresa')" placeholder="Empresa: ej. NetFlix. Uber, Apple" />
        @error('empresa')
                <livewire:mostrar-alerta :message='$message' />
            @enderror
    </div>
    <div>
        <x-input-label for="ultimo_dia" :value="__('Último día para postularse')" />

        <x-input id="ultimo_dia" class="block mt-1 w-full" type="date" wire:model="ultimo_dia" :value="old('ultimo_dia')" />
        @error('ultimo_dia')
                <livewire:mostrar-alerta :message='$message' />
            @enderror
    </div>
    <div>
        <x-input-label for="descripcion" :value="__('Descripcion del puesto')" />

        <textarea class="rounded-md shadow-sm border-gray-300 focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50 w-full" 
            wire:model="descripcion" placeholder="Descripción general del puesto, experiencia">
        </textarea>
        @error('descripcion')
                <livewire:mostrar-alerta :message='$message' />
            @enderror
    </div>
    <div>
        <x-input-label for="imagen" :value="__('imagen')" />

        <x-input id="imagen" class="block mt-1 w-full" type="file" wire:model="imagen_nueva" accept="image/*" />

        <div class="my-5 w-80">
            {{-- Para enlazar las imagenes del storage a la carpeta que el usuario tiene acceso en el sisitema
                de debe crear un link simbólico con 'sail artisan storage:link', estoy crea un link entre
                [public/storage] a [storage/app/public]  --}}
            <x-input-label :value="__('Imagen Actual')" />
            <img src="{{ asset('storage/vacantes/' . $imagen) }}" alt="{{ 'Imagen Vacante ' . $titulo }}">

        </div>

        {{-- Este div es para mostrar un preview de la imagen, livewire permite acceder a la ubicacion temporal
            de la imagen para mostrar una vista previa antes de subirla con la funcion temporaryUrl() --}}
        <div class="my-5 w-80">
            @if ($imagen_nueva)
                Imagen Nueva: <img src="{{ $imagen_nueva->temporaryUrl() }}">
            @endif

        </div>

        @error('imagen_nueva')
                <livewire:mostrar-alerta :message='$message' />
            @enderror
    </div>

    <x-button>
        Guardar Cambios
    </x-button>
     
</form>
