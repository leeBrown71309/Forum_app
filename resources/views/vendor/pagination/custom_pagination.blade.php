<nav class="pagination" role="navigation" aria-label="pagination">

    <ul class="pagination-list">
         {{-- Previous Page Link --}}
     @if ($paginator->onFirstPage())
            <li aria-disabled="true" aria-label="@lang('pagination.previous')">
                <a class="pagination-previous">Previous</a>
            </li>
        @else
            <li>
                <a class="pagination-previous" href="{{ $paginator->previousPageUrl() }}" rel="prev" aria-label="@lang('pagination.previous')" title="This is the first page">Previous</a>
            </li>
        @endif

      {{-- Pagination Elements --}}
    @foreach ($elements as $element)
      {{-- "Three Dots" Separator --}}
      @if (is_string($element))
          <li class="Disabled" aria-disabled="true"><span> {{ $element }}</span></li>
      @endif

      {{-- Array Of Links --}}
      @if (is_array($element))
          @foreach ($element as $page => $url)
              @if ($page == $paginator->currentPage())
                  <li class="is-current pagination-link mx-2" aria-current="page"><span> {{ $page }}</span></li>
              @else
                  <li class="mx-2 pagination-link"><a href="{{ $url }}">{{ $page }}</a></li>
              @endif
          @endforeach
        @endif
  @endforeach

   {{-- Next Page Link --}}
   @if ($paginator->hasMorePages())
        <li>
            <a class="pagination-next" href="{{ $paginator->nextPageUrl() }}" rel="next" aria-label="@lang('pagination.next')">Next page</a>
        </li>
    @else
        <li aria-disabled="true" aria-label="@lang('pagination.next')">
            <a class="pagination-next">Next page</a>
        </li>
    @endif
    </ul>
  </nav>
