export class ApiResponse<T> {
  success: boolean;
  data?: T;
  error?: {
    code: string;
    message: string;
    details?: any;
  };
  meta?: any;

  static success<T>(data: T, meta?: any): ApiResponse<T> {
    return {
      success: true,
      data,
      meta,
    };
  }

  static error(code: string, message: string, details?: any): ApiResponse<any> {
    return {
      success: false,
      error: {
        code,
        message,
        details,
      },
    };
  }
}

export class PaginationMeta {
  currentPage: number;
  totalPages: number;
  totalItems: number;
  itemsPerPage: number;
  hasNextPage: boolean;
  hasPrevPage: boolean;

  constructor(currentPage: number, totalItems: number, itemsPerPage: number) {
    this.currentPage = currentPage;
    this.totalItems = totalItems;
    this.itemsPerPage = itemsPerPage;
    this.totalPages = Math.ceil(totalItems / itemsPerPage);
    this.hasNextPage = currentPage < this.totalPages;
    this.hasPrevPage = currentPage > 1;
  }
}
