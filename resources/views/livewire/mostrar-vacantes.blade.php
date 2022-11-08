<div>

    <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">

        {{-- la directiva @forelse es una convinacion entre if y foreach --}}
        @forelse ( $vacantes as $vacante )
            <div class="p-6 bg-white border-b border-gray-200 md:flex md:justify-between md:place-items-center">
                {{-- elementos de la izquierda --}}
                <div class="space-y-3">
                    <a href="{{ route('vacantes.show', $vacante->id) }}" class="text-xl font-bold">
                        {{ $vacante->titulo }}
                    </a>
                    <p class="text-sm text-gray-600 font-bold">{{ $vacante->empresa}}</p>
                    <p class="text-sm text-gray-500"> {{ $vacante->ultimo_dia->format('d/m/Y')}}</p>
                </div>
                {{-- Elementos de la derecha del div --}}
                <div class="flex flex-col md:flex-row items-stretch gap-3 mt-5 md:mt-0">
                    <a href="{{ route('candidatos.index', $vacante) }}" 
                      class="bg-slate-800 py-2 px-4 rounded-lg text-white text-xs font-bold uppercase text-center">
                      {{$vacante->candidatos->count()}} Candidatos
                    </a>
                    <a href="{{ route( 'vacantes.edit', $vacante->id )}}" class="bg-blue-800 py-2 px-4 rounded-lg text-white text-xs font-bold uppercase text-center">Editar</a>
                    <button 
                        {{-- wire:click="$emit('eliminarVacante', {{ $vacante->id }})" --}}
                        wire:click="$emit('mostrarAlerta', {{ $vacante->id }})"
                        class="bg-red-800 py-2 px-4 rounded-lg text-white text-xs font-bold uppercase text-center">
                        Eliminar
                    </button>
                    
                </div>


            </div>
        @empty
            <p class="p-3 text-center text-sm text-gray-600">No hay vacantes para mostrar</p>
        @endforelse
        
    </div>

    <div class="mt-10">
        {{ $vacantes->links() }}
    </div>

</div>


@push('scripts')
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <script>

        document.addEventListener("DOMContentLoaded", function(event) {
            window.livewire.on('mostrarAlerta', vacanteId => {
                    Swal.fire({
                    title: 'Esta Seguro?',
                    text: "Estos cambios no se podrán revertir!",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Si, eliminalo!',
                    cancelButtonText: 'Cancelar'
                    }).then((result) => {
                    if (result.isConfirmed) {
                        window.livewire.emit('eliminarVacante', vacanteId)
                        Swal.fire(
                        'Borrado!',
                        'La vacante se ha eliminado.',
                        'success'
                        )
                    }
                    })
                });
        });

        // document.addEventListener('DOMContentLoaded', () => {
        //     Livewire.on('localizationUpdated', () => alert('test'));
        // });
    </script>

    <script>
        // Livewire.on('eliminarVacante', () => {
        //     alert('Hola')
        // })
        // Swal.fire({
        // title: 'Esta Seguro?',
        // text: "Estos cambios no se podrán revertir!",
        // icon: 'warning',
        // showCancelButton: true,
        // confirmButtonColor: '#3085d6',
        // cancelButtonColor: '#d33',
        // confirmButtonText: 'Si, eliminalo!',
        // cancelButtonText: 'Cancelar'
        // }).then((result) => {
        // if (result.isConfirmed) {
        //     Swal.fire(
        //     'Borrado!',
        //     'La vacante se ha eliminado.',
        //     'success'
        //     )
        // }
        // })
    </script>
@endpush